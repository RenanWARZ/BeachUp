import { Injectable } from '@angular/core';
import { Team } from './models/team.model';

@Injectable({
  providedIn: 'root',
})
export class TeamService {
  private readonly STORAGE_KEY = 'teams_data';

  constructor() {}

  getTeams(): Team[] {
    if (typeof window === 'undefined') return [];
    const data = localStorage.getItem(this.STORAGE_KEY);
    return data ? JSON.parse(data) : [];
  }

  addTeam(team: Team): void {
    const teams = this.getTeams();
    team.id = Date.now();
    teams.push(team);
    this.saveTeams(teams);
  }

  updateTeam(updatedTeam: Team): void {
    const teams = this.getTeams();
    const index = teams.findIndex((t) => t.id === updatedTeam.id);
    if (index !== -1) {
      teams[index] = updatedTeam;
      this.saveTeams(teams);
    }
  }

  deleteTeam(id: number): void {
    const teams = this.getTeams().filter((t) => t.id !== id);
    this.saveTeams(teams);
  }

  private saveTeams(teams: Team[]): void {
    if (typeof window !== 'undefined') {
      localStorage.setItem(this.STORAGE_KEY, JSON.stringify(teams));
    }
  }
}
